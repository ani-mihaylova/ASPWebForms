namespace ExamASP.NET.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Web;

    public class Like
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public int Value { get; set; }
    }
}