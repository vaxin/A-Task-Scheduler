package{
    public class Task {
        public var reachTime : Date;
        public var game : String;
        public var taskName : String;
		public var read : Boolean = false;
		public var sent : Boolean = false;
        public var loopType : int = ONCE;
		public var hour : int = -1;
		public var minute : int = -1;
		public var weekday : int = -1;
        public static const ONCE   : int = 0;
        public static const DAILY  : int = 1;
        public static const WEEKLY : int = 2;
		public static const FORK : int = 3;
        public function Task(date:Date, game:String, taskName:String){
            this.reachTime = date;
            this.game = game;
            this.taskName = taskName;
        }
		
		public static var WEEK_DAXIE : Array = ["日", "一","二","三","四","五","六"];
		public static function getDaxie(day:int):String{
			return WEEK_DAXIE[day];
		}
		public static function getTaskTimeStr(task:Object):String{
			var repr : String = "";
			switch(task.loopType){
				case Task.ONCE:
				repr = Task.getReachTimeStr(task.reachTime);
				break;
				case Task.DAILY:
				repr = "   每天 " + task.reachTime.getHours() + ":" + task.reachTime.getMinutes(); 
				break;
				case Task.WEEKLY:
				repr = "   每周" + getDaxie(task.reachTime.getDay()) + " " + task.reachTime.getHours() + ":" + task.reachTime.getMinutes(); 
				break;
			}
			return repr;
		}
        public static function getReachTimeStr(reachTime:Date):String{
            return reachTime.getFullYear() + '/' + (reachTime.getMonth() + 1) + '/' + reachTime.getDate() + ' ' +
                    reachTime.getHours() + ":" + reachTime.getMinutes();
        }
        public static function getMinutes(date:Date):Number{
			var t : Number = date.getTime();
        	return int(t / 1000 / 60); 
        }
		public static function getNowMinutes():Number{
			return getMinutes(new Date());
		}
		public static function hitTime(task:Object):Boolean{
			if (task == null) return false;
			var now : Date = new Date();
			var target : Date = task.reachTime;
			switch(task.loopType){
				case Task.ONCE:
					var nowMinutes : int = Task.getMinutes(now);
					if (Task.getMinutes(target) == nowMinutes){
						return true;
					}
					break;
				case Task.DAILY:
					if (now.getHours() == task.hour && now.getMinutes() == task.minute){
						return true;
					}
					break;
				case Task.WEEKLY:
//					trace('now' + now.getDay() + ',task'+task.weekday);
//					trace('now-hour' + now.getHours() + ', task'+task.hour);
//					trace('now-min' + now.getMinutes() + ',task' + task.minute);
					if (now.getDay() == task.weekday && now.getHours() == task.hour && now.getMinutes() == task.minute){
						return true;
					}
					break;
			}
			return false;
		}
		public static function genRemind(task:Object, owner:IRequester):Remind{
			return new Remind(task.game, "你设置的提醒<b>"+task.reachTime.getHours()+"时"+task.reachTime.getMinutes()+"分</b>已到!<br>任务:" + task.taskName, owner, task, Remind.TASK);
		}
    }
}
