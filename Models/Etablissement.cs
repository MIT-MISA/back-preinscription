using System;
using System.Collections.Generic;

namespace backPreinscription.Models;

public partial class Etablissement
{
    public int IdEtablissement { get; set; }

    public string NomEtablissement { get; set; } = null!;

    public virtual ICollection<Bachelier> Bacheliers { get; set; } = new List<Bachelier>();
}
