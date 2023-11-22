var questionNumber = 1;
var answers = [];

var max

window.addEventListener("load", function(){
});

window.addEventListener('message', function(event) {
  	var data = event.data
  	switch (data.action) {
    	case 'openTasks':
			$(".tasks-menu").fadeIn(285);
			$(".tasks-list").empty();
			$('.done-percentage').css('width', `0%`)
			for (const [key, value] of Object.entries(data.tasks)) {
				$(".tasks-list").append(`
					<div id="${value.id}">
						<div class="task-label task-todo">${value.label}</div>
						<div class="task-value task-todo-count">
							<i class="fa-solid fa-circle-check"></i>
						</div>
					</div>
				`)
			}
			max = data.maxPoints
			break;
		case 'updateTasks':
			$(`#${data.done} > .task-label`).addClass('task-done')
			$(`#${data.done} > .task-value`).addClass('task-done-icon')
			$(`#${data.done} > .task-label`).removeClass('task-todo')
			$(`#${data.done} > .task-value`).removeClass('task-todo-count')
			$('.done-percentage').css('width', `${(100 * data.done) / max}%`)
			break
		case 'updateDriveProgress':
			$(`#${data.id} > .task-label > span`).html(`${Number(data.count).toFixed(2)}`)
			break
		case 'closeTasks':
			$(".tasks-menu").fadeOut(285);
			break;
		case 'audioTask':
			var audioTask = new Audio(`tasks_audio/${data.filename}`);
			audioTask.play();
			break
  	}
})