if(!window['lezhin']) {
	lezhin = {};
	( function (_O) {
    _O.init = () => {
      const v = _O.Vars;
      v.curRound = 16;
      v.curStage = 0;
      v.gameHistory = {
        '16': [],
        '8': [],
        '4': [],
        '2': [],
        '1': []
      };
      v.lists = _O.Ctrl.getLists();
      _O.Ctrl.prevCancelOnOff();
    };
    _O.start = () => {
      _O.init();
      _O.Ctrl.gameNewStart.bind(_O.Ctrl)();
    };
    _O.Vars = {
      lists:null,
      curRound: 0,
      curStage: 0,
      maxRound: 16,
      gameHistory: null,
	  saveItem:''
    };
    _O.Ctrl = {
      getLists() {
        return [
          {
            name: '#1번 타투',
            imgSrc: 'images/01.jpg',
            selected: false
          },
          {
            name: '#2번 타투',
            imgSrc: 'images/02.jpg',
            selected: false
          },
          {
            name: '#3번 타투',
            imgSrc: 'images/03.jpg',
            selected: false
          },
          {
            name: '#4번 타투',
            imgSrc: 'images/04.jpg',
            selected: false
          },
          {
            name: '#5번 타투',
            imgSrc: 'images/05.jpg',
            selected: false
          },
          {
            name: '#6번 타투',
            imgSrc: 'images/06.jpg',
            selected: false
          },
          {
            name: '#7번 타투',
            imgSrc: 'images/07.jpg',
            selected: false
          },
          {
            name: '#8번 타투',
            imgSrc: 'images/08.jpg',
            selected: false
          },
          {
            name: '#9번 타투',
            imgSrc: 'images/09.jpg',
            selected: false
          },
          {
            name: '#10번 타투',
            imgSrc: 'images/10.jpg',
            selected: false
          },
          {
            name: '#11번 타투',
            imgSrc: 'images/11.jpg',
            selected: false
          },
          {
            name: '#12번 타투',
            imgSrc: 'images/12.jpg',
            selected: false
          },
          {
            name: '#13번 타투',
            imgSrc: 'images/13.jpg',
            selected: false
          },
          {
            name: '#14번 타투',
            imgSrc: 'images/14.jpg',
            selected: false
          },
          {
            name: '#15번 타투',
            imgSrc: 'images/15.jpg',
            selected: false
          },
          {
            name: '#16번 타투',
            imgSrc: 'images/16.jpg',
            selected: false
          }
        ];
      },
      rndLists(arr) { //배열 랜덤 섞음
        return arr.map((n) => { return [Math.random(), n] }).sort().map((n) => {  return n[1] });//n[1].selected = false;
      },
      selectedLists(arr) {
        return arr.filter((n) => n.selected === true);
      },
      gameNewStart() {
        const v = _O.Vars;
        v.gameHistory[v.curRound.toString()] = this.rndLists(v.lists);
        _O.Html.set.bind(_O.Html)();
      },
      copyObj(obj) { //Deep Copy
        let copy = {};
        for (let attr in obj) {
          if (obj.hasOwnProperty(attr)) {
            copy[attr] = obj[attr];
          }
        }
        copy.selected = false;
        return copy;
      },
      nextRound() {
        const v = _O.Vars;
        if(v.curRound <= 1) return;
        v.lists = _O.Ctrl.selectedLists(v.gameHistory[v.curRound.toString()]).map((n) => _O.Ctrl.copyObj(n));
        if(v.curRound > 1) v.curRound /= 2;
        v.curStage = 0;
        v.gameHistory[v.curRound.toString()] = this.rndLists(v.lists);
        // console.log('v.lists::',v.lists, 'v.gameHistory::',v.gameHistory);
        _O.Html.setRoundTitle();
      },
      prevCancelOnOff() {
        const footerObj = document.getElementById('footer');
        if(_O.Vars.curRound === _O.Vars.maxRound) {
          if(_O.Vars.curRound > 1 && _O.Vars.curStage > 0) footerObj.className = 'footer';
          else footerObj.className = 'footer soff';
        } else {
          if(_O.Vars.curRound > 1) footerObj.className = 'footer';
          else footerObj.className = 'footer soff';
        }
      }
    };
    _O.Event = {
      clickItem(obj) {
	
        const v = _O.Vars;
        if(v.curRound === 1) return;
        const idx = obj.id.split('_')[1];
        v.gameHistory[v.curRound.toString()][idx].selected = true;
        if(v.curStage < v.curRound/2) v.curStage++;
        if(v.curStage === v.curRound/2) _O.Ctrl.nextRound();

		//선택한 이미지의 #이름 값 가져온 후 saveItem에 저장
		const imgSrc = obj.querySelector('img').getAttribute('src');
		const srcIdx = Number(imgSrc.split('/')[1].split('.')[0]);
		//console.log(srcIdx);
		//console.log(_O.Ctrl.getLists()[srcIdx-1]);
		//console.log(_O.Ctrl.getLists()[srcIdx-1].name);
		v.saveItem += _O.Ctrl.getLists()[srcIdx-1].name.split('#')[1];
		v.saveItem += ',';
		
		console.log(v.saveItem);
		
		_O.Html.setItem();
        _O.Ctrl.prevCancelOnOff();
		
      },
      overItem(obj) {
        const objs = document.querySelectorAll('#list_ideal li a[hover="true"]');
        objs.forEach((itm) => itm.setAttribute('hover', 'false'));
        if(obj.getAttribute('hover') === 'true') return;
        obj.setAttribute('hover', 'true');
      },
      outItem(obj) {
        if(obj.getAttribute('hover') === 'false') return;
        obj.setAttribute('hover', 'false');
      },
      clickCancel() {
        _O.start();
      },
      clickPrev() {
        const v = _O.Vars;
        if(v.curStage > 0) v.curStage--;
        else {
          v.gameHistory[v.curRound.toString()] = [];
          if(v.curRound < _O.Vars.maxRound) {
            v.curRound *= 2;
            v.curStage = v.curRound / 2 - 1;
          }
          _O.Html.setRoundTitle();
          v.lists = v.gameHistory[v.curRound.toString()];
        }

        v.lists[v.curStage * 2].selected = false;
        v.lists[v.curStage * 2 + 1].selected = false;
        _O.Html.setItem();
        _O.Ctrl.prevCancelOnOff();
      },
	  clickTransferData(){
			location.href="MemberType?data="+_O.Vars.saveItem;  // 특성값 추출 페이지로 이동
			parent.window.opener.doSearch();
			parent.close();
	  }
    };
    _O.Html = {
      set() {
        this.setRoundTitle();
        this.setContent();
      },


	  // 마지막 1강 선택 후 나오는 것?
      setHistory() {
        const tObj = document.getElementById('modal');
        let key, roundDiv, imgObj, roundTitleDiv, roundImgWrapDiv;
        let historyTitleDiv = document.createElement('DIV'); //DIV생성
        historyTitleDiv.className = 'tit';
        historyTitleDiv.innerText = '히스토리';
        tObj.appendChild(historyTitleDiv);
        
		let wrapDiv = document.createElement('DIV');
        wrapDiv.className = 'history_box';
	
        for(key in _O.Vars.gameHistory) {
          roundDiv = document.createElement('DIV');
          roundDiv.className = 'round';
          roundTitleDiv = document.createElement('h5');
          roundTitleDiv.innerText = (key === '1' ? `최종 여행지` : `${key}강`);
          roundDiv.appendChild(roundTitleDiv);
          roundImgWrapDiv = document.createElement('DIV');
          _O.Vars.gameHistory[key].forEach((itm) => {
            imgObj = document.createElement('IMG');
            imgObj.setAttribute('src', itm.imgSrc);
            imgObj.className = `history_item ${itm.selected ? '' : (key !== '1' ? 'dim' : '')}`;
            roundImgWrapDiv.appendChild(imgObj);
          });
          roundDiv.appendChild(roundImgWrapDiv);
          wrapDiv.appendChild(roundDiv);
        }
        tObj.appendChild(wrapDiv);
      },
      setRoundTitle() {
        if(_O.Vars.curRound > 1) document.getElementById('roundTitle').innerText = `${_O.Vars.curRound}강 선택`;
        else document.getElementById('roundTitle').innerText = `축하합니다. 최종 여행지가 선정되었습니다.`;
      },
      setItem() {
        const s = _O.Html.getItem();
        const tObj = document.getElementById('list_ideal');
        if(!tObj) return;

        tObj.innerHTML = s;
        if(_O.Vars.curRound === 1) _O.Html.setHistory();
      },
      getItem() {
        let s = '', i = _O.Vars.curStage * 2, length = i + (_O.Vars.curRound > 1 ? 2 : _O.Vars.curRound);
        for(i; i < length && length <= _O.Vars.curRound; i++) {
          s += `
          <li>
            <a class="item ${_O.Vars.curRound === 1 ? 'final' : ''}" id="item_${i}" hover="false" href="javascript:void(0);" onclick="lezhin.Event.clickItem(this);" onmouseover="lezhin.Event.overItem(this);" onmouseout="lezhin.Event.outItem(this);">
              <span class="thumb"><img src="${_O.Vars.gameHistory[_O.Vars.curRound.toString()][i]['imgSrc']}" alt="여행지 사진"></span>
              <strong> ${_O.Vars.gameHistory[_O.Vars.curRound.toString()][i]['name']}</strong>
            </a>
          </li>
          `;
          if(_O.Vars.curRound === 1) {
            s += `
            <li id="history">
              <a class="modal final" id="modal" href="javascript:void(0);"></a>
            </li>
			<button class="moveBtn" onclick="lezhin.Event.clickTransferData();">취향찾기 종료</button>
            `;
          }
        }
        return s;
      },
      setContent() {
        const tObj = document.getElementById('content');
        tObj.className = 'content in_game';
        let s = `
          <ul class="list_ideal" id="list_ideal">
          ${this.getItem()}
          </ul>
        `;
        tObj.innerHTML = s;		

      }
    }
	}) (lezhin);
}


