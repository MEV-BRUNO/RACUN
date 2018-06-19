using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Racun.Models
{
    [Table("poduzece")]
    public class Company
    {
        [Required]
        [Key]
        public int id_poduzece { get; set; }

        [Display(Name = "Naziv")]
        public string naziv { get; set; }

        [Display(Name = "Grad")]
        public string grad { get; set; }
        
        [Display(Name = "Drzava")]
        public string drzava { get; set; }
        
        [Display(Name = "Telefon")]
        public string tel { get; set; }
        
        [Display(Name = "Mobitel")]
        public string mob { get; set; }

        [DataType(DataType.EmailAddress, ErrorMessage = "Upisali ste nevaljanu e-mail adresu")]
        [Display(Name = "Email adresa")]
        public string email { get; set; }

        [Display(Name = "OIB")]
        public string oib { get; set; }

        [Display(Name = "Odgovorna osoba")]
        public string odgovorna_osoba { get; set; }

        [Display(Name = "Ziro racun")]
        public string ziro_racun { get; set; }

        [Display(Name = "Banka")]
        public string banka { get; set; }

        [Display(Name = "PDV")]
        public float pdv { get; set; }

        [Display(Name = "Biljeska")]
        public string biljeska { get; set; }

        [Display(Name = "Pecat")]
        public string pecat { get; set; }
    }
}