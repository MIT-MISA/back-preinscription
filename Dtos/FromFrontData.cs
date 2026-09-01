public class CandidateInfo
{
    public required string Id { get; set; }
    public required string FirstName { get; set; }
    public string? LastName { get; set; }
    public required string BaccalaureateNumber { get; set; }
    public int GraduationYear { get; set; }
    public required string Series { get; set; } // Enum possible si tu veux
    public bool IsEligible { get; set; }
}

public class ProgramData
{
    public required int IdPortail { get; set; }
    public required string NomPortail { get; set; }
    public required string Abbreviation { get; set; }
}

public class PersonalInfo
{
    public required string FirstName { get; set; }
    public required string LastName { get; set; }
    public required string Email { get; set; }
    public required string Telephone { get; set; }
}

public class BankInfo
{
    public required string Reference { get; set; }
    public required string DateRef { get; set; }
    public required string AgenceRef { get; set; }
}

public class ApplicationData
{
    public required CandidateInfo CandidateInfo { get; set; }
    public required ProgramData SelectedProgram { get; set; }
    public required PersonalInfo PersonalInfo { get; set; }
    public required BankInfo BankInfo { get; set; }
    public string? ModeInscription { get; set; }
}
