namespace monitoramento_ambiental_mongodb.Data
{
   public class DataBaseSettings
    {
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
        public string PrevisaoChuvaCollectionName { get; set; }
        public string AlertaCollectionName { get; set; }
    }

}
