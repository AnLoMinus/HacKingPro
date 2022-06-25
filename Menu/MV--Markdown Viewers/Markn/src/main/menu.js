import Menu from 'menu'
import mediator from './mediator'
import events from './events'

export default class MyMenu {
  static menu = Menu.buildFromTemplate(Menu.sendActionToFirstResponder != null ? [
    {
      label: 'Markn',
      submenu: [
        {
          label: 'About Markn',
          click: function () {
            mediator.emit(events.OPEN_ABOUT_DIALOG)
          }
        }, {
          type: 'separator'
        }, {
          label: 'Hide Electron',
          accelerator: 'CommandOrControl+H',
          selector: 'hide:'
        }, {
          label: 'Hide Others',
          accelerator: 'CommandOrControl+Shift+H',
          selector: 'hideOtherApplications:'
        }, {
          label: 'Show All',
          selector: 'unhideAllApplications:'
        }, {
          type: 'separator'
        }, {
          label: 'Quit',
          accelerator: 'CommandOrControl+Q',
          selector: 'terminate:'
        }
      ]
    }, {
      label: 'File',
      submenu: [
        {
          label: 'New Window',
          accelerator: 'CommandOrControl+N',
          click: function () {
            mediator.emit(events.OPEN_NEW_WINDOW)
          }
        }, {
          label: 'Open File',
          accelerator: 'CommandOrControl+O',
          click: function () {
            mediator.emit(events.OPEN_FILE)
          }
        }, {
          type: 'separator'
        }, {
          label: 'Recently opened files',
          submenu: []
        }
      ]
    }, {
      label: 'Edit',
      submenu: [
        {
          label: 'Cut',
          accelerator: 'CommandOrControl+X',
          selector: 'cut:'
        }, {
          label: 'Copy',
          accelerator: 'CommandOrControl+C',
          selector: 'copy:'
        }, {
          label: 'Paste',
          accelerator: 'CommandOrControl+V',
          selector: 'paste:'
        }, {
          label: 'Select All',
          accelerator: 'CommandOrControl+A',
          selector: 'selectAll:'
        }, {
          type: 'separator'
        }, {
          label: 'Find',
          accelerator: 'CommandOrControl+F',
          click: function () {
            mediator.emit(events.FIND)
          }
        }
      ]
    }, {
      label: 'View',
      submenu: [
        {
          label: 'Reload',
          accelerator: 'CommandOrControl+R',
          click: function () {
            mediator.emit(events.RELOAD)
          }
        }, {
          label: 'Toggle DevTools',
          accelerator: 'Alt+CommandOrControl+I',
          click: function () {
            mediator.emit(events.TOGGLE_DEVTOOLS)
          }
        }
      ]
    }, {
      label: 'Window',
      submenu: [
        {
          label: 'Minimize',
          accelerator: 'CommandOrControl+M',
          selector: 'performMiniaturize:'
        }, {
          label: 'Close',
          accelerator: 'CommandOrControl+W',
          selector: 'performClose:'
        }, {
          type: 'separator'
        }, {
          label: 'Bring All to Front',
          selector: 'arrangeInFront:'
        }
      ]
    }, {
      label: 'Help',
      submenu: [
        {
          label: 'Markn Help',
          click: function () {
            mediator.emit(events.OPEN_HELP)
          }
        }
      ]
    }
  ] : [
    {
      label: 'File',
      submenu: [
        {
          label: 'New Window',
          accelerator: 'CommandOrControl+N',
          click: function () {
            mediator.emit(events.OPEN_NEW_WINDOW)
          }
        }, {
          label: 'Open File',
          accelerator: 'CommandOrControl+O',
          click: function () {
            mediator.emit(events.OPEN_FILE)
          }
        }, {
          type: 'separator'
        }, {
          label: 'Recently opened files',
          submenu: []
        }, {
          type: 'separator'
        }, {
          label: 'Exit',
          accelerator: 'CommandOrControl+Q',
          click: function () {
            mediator.emit(events.QUIT)
          }
        }
      ]
    }, {
      label: 'Edit',
      submenu: [
        {
          label: 'Find',
          accelerator: 'CommandOrControl+F',
          click: function () {
            mediator.emit(events.FIND)
          }
        }
      ]
    }, {
      label: 'View',
      submenu: [
        {
          label: 'Reload',
          accelerator: 'CommandOrControl+R',
          click: function () {
            mediator.emit(events.RELOAD)
          }
        }, {
          label: 'Toggle DevTools',
          accelerator: 'Alt+CommandOrControl+I',
          click: function () {
            mediator.emit(events.TOGGLE_DEVTOOLS)
          }
        }
      ]
    }, {
      label: 'Help',
      submenu: [
        {
          label: 'About Markn',
          click: function () {
            mediator.emit(events.OPEN_ABOUT_DIALOG)
          }
        }
      ]
    }
  ])

  constructor () {
    Menu.setApplicationMenu(MyMenu.menu)
  }
}
