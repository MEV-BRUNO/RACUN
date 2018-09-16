using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Racun.Models

{
    [Table("racun_stavka")]
    public class ReceiptItem
    {
        [Required] [Key] public int id_racun { get; set; }

        [Required] [Key] public int id_usluga { get; set; }

        [Display(Name = "Kolicina")] public int kolicina { get; set; }

        [Display(Name = "Cijena")] public int cijena { get; set; }

        [Display(Name = "Rabat")] public int rabat { get; set; }

    }
}