using System.Collections.Generic;

namespace myproject.Entities
{
    public class ActivityLog
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string ActivityName { get; set; }
        public DateTime Date { get; set; }
    }
}