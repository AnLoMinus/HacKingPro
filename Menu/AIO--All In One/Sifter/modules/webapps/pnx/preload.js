//WebToDesk v1.0.0
//Sameera Damith (CodeStack)
//damith.sameera1@gmail.com

const { ipcRenderer } = require('electron')
const appConfig = require('./config')

window.addEventListener('DOMContentLoaded', () => {

  // Hidden webpage elements uding ID tags
  if(appConfig.hideElementsId.length > 0) {
    for(let elementsId = 0; elementsId < appConfig.hideElementsId.length; elementsId++) {
      let hiddenElementsId = document.getElementById(appConfig.hideElementsId[elementsId])
      hiddenElementsId ? hiddenElementsId.style.display='none' : console.log
    }
  }

  // Hidden webpage elements uding Class tags
  if(appConfig.hideElementsClass.length > 0) {
    for(let elementsClass = 0; elementsClass < appConfig.hideElementsClass.length; elementsClass++) {
      let hiddenElementsClass = document.getElementsByClassName(appConfig.hideElementsClass[elementsClass])
      hiddenElementsClass ? hiddenElementsClass[0].style.visibility='hidden' : console.log
    }
  }
  
  //Change application tiitle
  document.title = appConfig['appName']

  //Error page reload again button press
  let tryagainbtn = document.getElementById("tryagain")
  tryagainbtn ? tryagainbtn.onclick = runc : false
  function runc() {
    ipcRenderer.send('online-status-changed', true)
  }

})
