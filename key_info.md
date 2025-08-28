Got it 👍 — you don’t need a “real” product key for a **lab Windows 11 VM**. Just like Windows Server, Microsoft provides **evaluation / generic keys** that let you install and run for testing.

---

### 🔹 Option 1: Skip key at install

When you boot the Windows 11 ISO:

* At the product key screen, click **“I don’t have a product key.”**
* Pick the edition you want (Windows 11 Pro is usually best for labs).
* It will install and run in **evaluation mode** — fully functional, but you’ll get a watermark and limited personalization. Perfect for lab use.

---

### 🔹 Option 2: Use a Microsoft **generic installation key**

These are public keys from Microsoft, only good for install (not activation):

* **Windows 11 Pro** → `VK7JG-NPHTM-C97JM-9MPGT-3V66T`
* **Windows 11 Enterprise** → `NPPR9-FWDCX-D2C8J-H872K-2YT43`
* **Windows 11 Education** → `NW6C2-QMPVW-D7KKK-3GKT6-VCFB2`

These won’t activate permanently, but they’ll let you finish setup and join the machine to your domain for testing.

---

### ✅ My recommendation

* Use **Windows 11 Pro ISO**.
* Skip the product key (or use the Pro generic key above).
* Get it running, assign it a NIC in the same VMware network as your DC.
* Point **DNS = 192.168.194.130** (your DC).
* Then join the domain `814north.local` and log in as `devops`.

---

👉 Do you want me to give you the **step-by-step VMware setup for this Win11 VM** (CPU, RAM, disk, NIC settings, install flow), so it’s guaranteed to work smoothly in your lab?
