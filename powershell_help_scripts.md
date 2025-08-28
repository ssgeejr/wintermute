# PowerShell Help Scripts 

What you’re seeing is Windows **power management kicking in** inside the VM. By default, Windows 10/11 clients will:

* Turn off the display after 10–15 minutes.
* Go into **Sleep / Suspend** after 30 minutes (even in a VM).
* VMware then pauses the guest, so when you click back in, it looks like you’re “restoring” the machine.

That’s normal behavior on physical PCs, but it’s annoying in labs because it disrupts testing.

---

## 🛠 Fix for Your Win11 Clients

Do this once per VM (DEVOPS01, USER01, BLUE01):

1. **Start → Settings → System → Power & battery**

   * Expand **Screen and sleep**.
   * Set both **Screen** and **Sleep** timers to **Never**.

2. (Optional for consistency) Also disable hibernation via PowerShell:

   ```powershell
   powercfg -h off
   ```

3. Snapshots: Once set, snapshot the VM → you’ll never have to repeat.

---

## 🛠 For Your Domain

Later, you can control this **centrally** via Group Policy:

* `Computer Configuration → Policies → Administrative Templates → System → Power Management`.
* Force domain-joined machines to **never sleep** unless you want them to.

---

✅ That’ll keep your lab VMs running steadily — no more “restore” interruptions.

👉 Do you want me to give you the **quick GPO setup** so your entire domain ignores sleep, instead of fixing each VM one by one?




