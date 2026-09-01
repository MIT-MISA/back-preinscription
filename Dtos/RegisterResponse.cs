public class portailResponse
{
    public int IdPortail { get; set; }

    public string? NomPortail { get; set; }

    public string? Abbreviation { get; set; }
}

public class preinscriptionReturn
{
    public int? Id { get; set; }
    public string? Email { get; set; }

    public string? Tel { get; set; }

    public string? RefBancaire { get; set; }

    public string? Agence { get; set; }

    public DateTime DatePaiement { get; set; }
    public int? IdBac { get; set; }
    public int? IdPortail { get; set; }
    public string ? ModeInscription { get; set; }
}

public class PreinscriptionStatus
{
    public bool IsClosed { get; set; }
}