using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Racun.Models
{
    [Table("sistem")]
    public class System
    {
        [Required]
        [Key]
        public int id_poduzece { get; set; }

        [Display(Name = "id_zaglavlje")]
        public int id_zaglavlje { get; set; }

        [Display(Name = "id_podnozje")]
        public int id_podnozje { get; set; }

        [Display(Name = "id_predlorak_rac")]
        public int id_predlorak_rac { get; set; }

        [Display(Name = "id_model_broja")]
        public int id_model_broja { get; set; }

        [Display(Name = "br_zadnjeg_racuna")]
        public int br_zadnjeg_racuna { get; set; }

        [Display(Name = "godina")]
        public int godina { get; set; }
        
    }
}