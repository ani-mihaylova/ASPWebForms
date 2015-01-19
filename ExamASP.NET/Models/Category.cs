﻿namespace ExamASP.NET.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using System.Web;

    public class Category
    {
        public Category()
        {
            this.Articles = new HashSet<Article>();
        }

        [Key]
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }

        public virtual ICollection<Article> Articles { get; set; }


    }
}