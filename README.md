<p>
  <a href="https://github.com/nodev7/Seraph/stargazers">
    <img src="https://img.shields.io/github/stars/nodev7/Seraph?style=social">
  </a>
  <a href="https://github.com/nodev7/Seraph/releases/latest">
    <img src="https://img.shields.io/github/v/release/nodev7/seraph?include_prereleases">
  </a>
  <a href="https://github.com/nodev7/Seraph/releases">
    <img src="https://img.shields.io/github/downloads/nodev7/seraph/total.svg">
  </a>
  <a href="https://github.com/nodev7/Seraph/issues?q=is%3Aissue+is%3Aclosed">
    <img src="https://img.shields.io/github/issues-closed/nodev7/seraph">
  </a>
  <a href="https://github.com/nodev7/Seraph/commits/main">
    <img src="https://img.shields.io/github/commit-activity/m/nodev7/seraph">
  </a>
</p>

---

# Seraph  
**Automate Temporary Application Installations with Winget**  

Seraph is a lightweight PowerShell-written tool that silently installs applications using `winget` and automatically removes them once they are closed. This allows for easy app testing for deployment/use.

---

### How It Works/manual:
---
1. Unzip the archive, place it in `C:\Users\YOURUSERNAME\Documents\WindowsPowerShell\Modules`, if you dont have a modules folder, create one in `.\WindowsPowershell`.
2. In a pwsh session, import the module, `Import-Module seraph`
3. Run the function `seraphinstall`
4. Follow the prompt.
6. The aplication is silently installed.
7. The powershell session monitors if the process is still running,
8. **if the app is nclosed it automaticlly uninstalls the app**

### Preview:
---
![image](https://github.com/user-attachments/assets/7bab10a0-d832-4b60-a5af-a8f92064e786)

