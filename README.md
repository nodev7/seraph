# Winget Exorcist  
**Automate Temporary Application Installations with Winget**  

Winget Exorcist is a lightweight PowerShell-based tool that installs applications using `winget` through the microsoft store and automatically removes them once they are closed. This allows for temporary installations without leaving unnecessary software behind.  

## Features  
- **Automated Installation**: Installs applications with a single command.  
- **Temporary Installs**: Automatically removes applications once they are closed.  
- **Process Monitoring**: Ensures applications are removed from the system after use.  

## How It Works  
1. Enter the application name.  
2. The tool confirms if it exists.  
3. The application is installed and monitored.  
4. Once closed, it is automatically removed.  
