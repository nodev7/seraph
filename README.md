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

Seraph is a lightweight PowerShell-written tool that installs applications using `winget` and automatically removes them once they are closed. This allows for easy app testing for deployment/use.

## How It Works  
1. Enter the application name.  
2. The tool confirms if it exists, grabs the ID, version (if applicable ). 
3. The application is installed and monitored for process closure.  
4. Once closed, it is automatically removed.
