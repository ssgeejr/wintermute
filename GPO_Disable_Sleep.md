😎 Got it — professionals don’t log into every box, we push policy once and let AD handle it. Let’s do this the **enterprise way** with a Group Policy Object (GPO).

---

## 🛠 Disable Sleep Domain-Wide with Group Policy

### Step 1 — Open GPMC

On **LAB-DC01**:

* Press **Win + R** → type `gpmc.msc` → Enter.
* This opens **Group Policy Management Console**.

---

### Step 2 — Create a New GPO

1. In the left pane, expand **Forest → Domains → 814north.local**.
2. Right-click **814north.local** → *Create a GPO in this domain, and Link it here…*
3. Name it:

   ```
   Disable Sleep
   ```

---

### Step 3 — Edit the GPO

1. Right-click **Disable Sleep** → *Edit*.
2. Navigate to:

   ```
   Computer Configuration
      → Policies
         → Administrative Templates
            → System
               → Power Management
                  → Sleep Settings
   ```
3. Configure:

   * **Allow standby states (S1–S3) when sleeping (plugged in)** → **Disabled**
   * **Specify the system sleep timeout (plugged in)** → **Enabled**, set to `0` (Never)
   * **Turn off hybrid sleep (plugged in)** → **Enabled**

---

### Step 4 — Apply

* Close editor.
* On each client (or wait for refresh), run:

  ```powershell
  gpupdate /force
  ```

---

## ✅ Outcome

* All domain-joined Win11 machines (DEVOPS01, USER01, BLUE01, future ones too) will never go to sleep.
* You did it once, AD enforces it everywhere.

---

Perfect 👍 — let’s push the **Group Policy update remotely** so all your domain-joined Win11 boxes pull down the new *Disable Sleep* policy without you logging into each one.

---

## 🛠 Method 1 — Use `Invoke-GPUpdate` from LAB-DC01

On **LAB-DC01**, open **Windows PowerShell 5.1** and run:

```powershell
# Run against all computers in the domain
Invoke-GPUpdate -Computer WIN11-DEVOPS01 -Force
Invoke-GPUpdate -Computer WIN11-USER01  -Force
Invoke-GPUpdate -Computer WIN11-BLUE01  -Force
```

Each command will contact the remote machine, tell it to refresh policies, and enforce the new settings.

---

## 🛠 Method 2 — Push to *all* domain machines

If you want to refresh everything at once:

```powershell
Get-ADComputer -Filter * | ForEach-Object {
    Invoke-GPUpdate -Computer $_.Name -Force
}
```

⚠️ Note: Machines must be **powered on** and reachable over the network for this to succeed.

---

## 🛠 Method 3 — Group Policy Management Console (GPMC)

1. On LAB-DC01 → open `gpmc.msc`.
2. Right-click **814north.local** → *Group Policy Update*.
3. This sends an update signal to **all computers in the OU**.

---

### ✅ Result

* Within a minute or two, all your Win11 boxes (DEVOPS01, USER01, BLUE01) will apply the new “Disable Sleep” policy.
* No need to log users in.

---


