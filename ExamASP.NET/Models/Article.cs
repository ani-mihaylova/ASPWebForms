namespace ExamASP.NET.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Web;


    public class Article
    {

        [Key]
        public int ID { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        [Required]
        public virtual ApplicationUser Author { get; set; }

        [Required]
        public DateTime DateCreated { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }


        public virtual Like Likes { get; set; }
    }
}