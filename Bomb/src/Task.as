package{
    public class Task{
        public var reachTime : Date;
        public var game : String;
        public var taskName : String;
        public var loopType : int = ONCE;
        public static const ONCE   : int = 0;
        public static const DAILY  : int = 1;
        public static const WEEKLY : int = 2;
        public function Task(date:Date, game:String, taskName:String){
            this.reachTime = date;
            this.game = game;
            this.taskName = taskName;
        }
        public function get reachTimeStr():String{
            return this.reachTime.getFullYear() + '-' + this.reachTime.getMonth() + '-' + this.reachTime.getDate() + ' ' +
                    this.reachTime.getHours() + ":" + this.reachTime.getMinutes();
        }
        public function equals(task:Task):Boolean{
            return (task.reachTime.getTime() == this.reachTime.getTime()) && (this.game == task.game) && (this.taskName == task.taskName);
        }
    }
}
