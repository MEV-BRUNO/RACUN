using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Racun.Models
{
        [Table("usluge")]
        public class Services
        {
            //[Required]
            //[Key]
            public int id_usluga { get; set; }

            [Display(Name = "id_poduzeca")]
            public int id_poduzeca { get; set; }
        
            [Display(Name = "Naziv")]
            public string naziv { get; set; }

            [Display(Name = "Cijena")]
            public int cijena { get; set; }
        
            [Display(Name = "Mjerna jedinica")]
            public string mjerna_jedinica { get; set; }
        
        }
}