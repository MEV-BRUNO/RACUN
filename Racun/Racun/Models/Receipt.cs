using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Racun.Models

    {
        [Table("racun")]
        public class Receipt
        {
            [Required]
            [Key]
            public int id_racun { get; set; }

            [Display(Name = "Datum")]
            public string datum { get; set; }

            [Display(Name = "id_poduzece")]
            public int id_poduzece { get; set; }

            [Display(Name = "id_kupac")]
            public int id_korisnik { get; set; }

            [Display(Name = "Naslov")]
            public string naslov { get; set; }

            [Display(Name = "Iznos")]
            public int iznos { get; set; }

            [Display(Name = "PDV")]
            public float pdv { get; set; }

            [Display(Name = "Oznaka")]
            public string oznaka { get; set; }

            [Display(Name = "Vrijeme izdavanja")]
            public string vrijeme_izdavanja { get; set; }
        }
    }