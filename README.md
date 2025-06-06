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

# Seraph   (scoop and chocolaty support is coming)
**Automate Temporary Application Installations with Winget**  

Seraph is a lightweight PowerShell-written tool that silently installs applications using `winget` and automatically removes them once they are closed. This allows for easy app testing for deployment/use.

---
 
### Manual:
---

- (reccomended to add module import inside `$PROFILE`)

 **install method 1:**
1. Install the module from the `psgallery`, `Install-module seraph` 
2. In a pwsh session, import the module, `Import-Module seraph`

 **install method 2:**
1. download latest release
2. unzip the archive to `C:\Users\$env:USERNAME\Documents\WindowsPowershell\Modules` (pwsh 5.1/default installation)
   (if newer vers, wherever your module directory is)

### Preview:
---
![image](https://github.com/user-attachments/assets/7bab10a0-d832-4b60-a5af-a8f92064e786)

