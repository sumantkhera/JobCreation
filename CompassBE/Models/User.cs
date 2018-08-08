namespace CompassBE.Models
{
    public class User
    {
        public string UserId { get; set; }
        public string PasswordHash { get; set; }
        public string Salt { get; set; }
    }
}
