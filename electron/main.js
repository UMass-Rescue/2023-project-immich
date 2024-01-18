const { app, BrowserWindow } = require('electron')

const createWindow = () => {
  const win = new BrowserWindow({
    minWidth: 1024,
    minHeight: 768,
    autoHideMenuBar: true,
  })

  win.maximize()
  win.loadURL('http://localhost:2283')
}

app.whenReady().then(() => {
  createWindow()
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

