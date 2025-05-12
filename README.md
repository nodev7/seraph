<p>
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


# Seraph  
**Automate Temporary Application Installations with Winget**  

Seraph is a lightweight PowerShell-based tool that installs applications using `winget` through the microsoft store and automatically removes them once they are closed. This allows for temporary installations without leaving unnecessary software behind.  

## How It Works  
1. Enter the application name.  
2. The tool confirms if it exists.  
3. The application is installed and monitored.  
4. Once closed, it is automatically removed.  
