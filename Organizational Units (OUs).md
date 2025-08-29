Excellent 👍 — this is where AD starts to look *professional*. Instead of treating every machine the same, you put them in **Organizational Units (OUs)** and apply Group Policies where they belong.

---

## 🛠 Step 1 — Open ADUC

On **LAB-DC01**:

* Press **Win + R** → type `dsa.msc` → Enter.
* This opens **Active Directory Users and Computers (ADUC)**.

---

## 🛠 Step 2 — Create Two OUs

In the left tree:

1. Right-click your domain (`814north.local`) → *New → Organizational Unit*.

   * Name it: **Servers**
   * Check *Protect container from accidental deletion*.
2. Repeat, create another OU: **Workstations**

---

## 🛠 Step 3 — Move Computers

Still in ADUC:

* Drag **LAB-DC01** into **Servers**.
* Drag **WIN11-DEVOPS01**, **WIN11-USER01**, and **WIN11-BLUE01** into **Workstations**.

Now your domain looks like:

```
814north.local
 ├── Servers
 │    └── LAB-DC01
 └── Workstations
      ├── WIN11-DEVOPS01
      ├── WIN11-USER01
      └── WIN11-BLUE01
```

---

## 🛠 Step 4 — Link GPOs

* In **Group Policy Management (gpmc.msc)**:

  * Right-click **Workstations** OU → Link Existing GPO → select **Disable Sleep**.
  * Leave Servers OU without that GPO.

---

## 🛠 Step 5 — Refresh Policy

From LAB-DC01 PowerShell:

```powershell
Get-ADComputer -SearchBase "OU=Workstations,DC=814north,DC=local" -Filter * |
    ForEach-Object { Invoke-GPUpdate -Computer $_.Name -Force }
```

---

✅ Now:

* Your **workstations** obey “Disable Sleep.”
* Your **servers** stay untouched.
* And every new computer you drop in the Workstations OU auto-inherits the right policy.

---

👉 Do you want me to also give you the **OU structure I’d recommend for a small but realistic lab** (Users OU, Groups OU, Servers OU, Workstations OU), so you’re building good habits for scaling?
