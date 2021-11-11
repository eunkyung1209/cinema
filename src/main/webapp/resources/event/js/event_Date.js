// ================================
// START YOUR APP HERE
// ================================
//화면 로딩 후 바로 실행; 달력가지고옴
//.ready(fufunction(){ 자체의 구문이 화면의 시작임을 알림
//$(document).ready()는 문서가 준비되면 매개변수로 넣은 콜백 함수를 실행하라는 의미입니다.
//init 이라는 이름은 보통 초기화 의 의미를 지닌 함수나 객체를 작성할 때 많이 사용합니다

$(document).ready(function(){
		
	const init = {
			  monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
			  dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
			  today: new Date(), // 월 가져오는 함수선언
			  monForChange: new Date().getMonth(), // 월 가져오겠다고
			  activeDate: new Date(), // 엑티브를 이용해 새로운 달로 넘어감
			  getFirstDay: (yy, mm) => new Date(yy, mm, 1), //처음 년,월
			  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0), //처음 년, 월 , 일 더하는값
			  nextMonth: function () { // 다음 달
			    let d = new Date();
			    d.setDate(1);
			    d.setMonth(++this.monForChange);
			    this.activeDate = d;
			    return d;
			  },
			  prevMonth: function () {
			    let d = new Date();
			    d.setDate(1);
			    d.setMonth(--this.monForChange);
			    this.activeDate = d;
			    return d;
			  },
			  addZero: (num) => (num < 10) ? '0' + num : num,
			  activeDTag: null,
			  getIndex: function (node) {
			    let index = 0;
			    while (node = node.previousElementSibling) {
			      index++;
			    }
			    return index;
			  }
			};

			const $calBody = document.querySelector('.cal-body');
			const $btnNext = document.querySelector('.btn-cal.next');
			const $btnPrev = document.querySelector('.btn-cal.prev');

			/**
			 * @param {number} date
			 * @param {number} dayIn
			*/
			function loadDate (date, dayIn) {
			  document.querySelector('.cal-date').textContent = date;
			  document.querySelector('.cal-day').textContent = init.dayList[dayIn];
			}

			/**
			 * @param {date} fullDate
			 */
			function loadYYMM (fullDate) {
			  let yy = fullDate.getFullYear();
			  let mm = fullDate.getMonth();
			  let firstDay = init.getFirstDay(yy, mm);
			  let lastDay = init.getLastDay(yy, mm);
			  let markToday;  // for marking today date
			  
			  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
			    markToday = init.today.getDate();
			  }

			  document.querySelector('.cal-month').textContent = init.monList[mm];
			  document.querySelector('.cal-year').textContent = yy;

			  let trtd = '';
			  let startCount;
			  let countDay = 0;
			  for (let i = 0; i < 6; i++) {
			    trtd += '<tr>';
			    for (let j = 0; j < 7; j++) {
			      if (i === 0 && !startCount && j === firstDay.getDay()) {
			        startCount = 1;
			      }
			      if (!startCount) {
			        trtd += '<td>'
			      } else {
			        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
			        trtd += '<td class="day';
			        trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
			        trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
			      }
			      trtd += (startCount) ? ++countDay : '';
			      if (countDay === lastDay.getDate()) { 
			        startCount = 0; 
			      }
			      trtd += '</td>';
			    }
			    trtd += '</tr>';
			  }
			  $calBody.innerHTML = trtd;
			}

			/**
			 * @param {string} val
			 */
			function createNewList (val) {
			  let id = new Date().getTime() + '';
			  let yy = init.activeDate.getFullYear();
			  let mm = init.activeDate.getMonth() + 1;
			  let dd = init.activeDate.getDate();
			  const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

			  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

			  let eventData = {};
			  eventData['date'] = date;
			  eventData['memo'] = val;
			  eventData['complete'] = false;
			  eventData['id'] = id;
			  init.event.push(eventData);
			  $todoList.appendChild(createLi(id, val, date));
			}

			loadYYMM(init.today);
			loadDate(init.today.getDate(), init.today.getDay());

			$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
			$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));
				
			//addEventListener 여러 이벤트를 등록할 수 있고, 특정 이벤트를 제거(removeEventListener)할 수 있음.
			//.target말고도 this라는 객체를 이용해 현재 이벤트가 발생한 대상을 가리킬 수 있다. 
			//이때 주의할 점은 e.target과 this는 DOM 객체이고, jQuery 객체가 아니기 때문에 jQuery 메소드를 사용할 수 없다
			
			
			// 해당일자 클릭..
			$calBody.addEventListener('click', (e) => {
			  if (e.target.classList.contains('day')) {
			    if (init.activeDTag) {
			      init.activeDTag.classList.remove('day-active');
			     
			    }
			    let day = Number(e.target.textContent);
			    loadDate(day, e.target.cellIndex);
			    e.target.classList.add('day-active');
			    init.activeDTag = e.target;
			    init.activeDate.setDate(day);
			   }
			  
		
			  
			  //클릭한 날의 년월일 데이터
			  var evenDate = $('.day-active').attr('data-fdate');
			  //alert(evenDate);
			  
			  $.ajax({

					url: '/event/eventAjax', 
					type: 'post',
					data: {'evenDate' : evenDate}, 
					success: function(result) { 
						
						let list = '';
						$('#aaaa').empty();
						var text = document.createTextNode("\u00a0");
						text = encodeURIComponent(text);
						
						list+= '<h6>이달의 행사</h6>';
						list += '\u00a0';
						list+= '<ul>';
						$(result).each(function(index, element) {
							
							list+='<li>'+ element.evenDate + '\u00a0'+'\u00a0'+'\u00a0'+'\u00a0'+'\u00a0'+'\u00a0'+'\u00a0'+'\u00a0' + element.evenName+'</li>';
							
							
						})
						list+= '</ul>';
						$('#aaaa').append(list);
						
					}
			  });
			  
	});
});

//함수 선언 영역
(function($){
   
	
})(jQuery);
