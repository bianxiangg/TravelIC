﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TravelInCloud.Models.HomeViewModels
{
    public class ChangeStoreInfoViewModel
    {
        [Required]
        public string StoreOwnerName { get; set; }
        [Required]
        public string StoreOwnerCode { get; set; }
        [Required]
        public string StoreOwnerPhone { get; set; }
        [Required]
        public string StoreName { get; set; }
        [Required]
        public string StoreDescription { get; set; }
        [Required]
        public string StoreLocation { get; set; }
    }
}
