//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HospitalASP
{
    using System;
    using System.Collections.Generic;
    
    public partial class Drug
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Drug()
        {
            this.DoctorDischarges = new HashSet<DoctorDischarge>();
            this.DoctorDischarges1 = new HashSet<DoctorDischarge>();
            this.DoctorDischarges2 = new HashSet<DoctorDischarge>();
        }
    
        public System.Guid DrugID { get; set; }
        public System.Guid DrugProviderID { get; set; }
        public string DrugName { get; set; }
        public string DrugPurpose { get; set; }
        public bool IsPrescriptionAllowed { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorDischarge> DoctorDischarges { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorDischarge> DoctorDischarges1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorDischarge> DoctorDischarges2 { get; set; }
        public virtual DrugProvider DrugProvider { get; set; }
    }
}
