#r "nuget: Newtonsoft.Json, 12.0.3"

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

var file1 = Args[0];
var file2 = Args[1];
var o1 = JObject.Parse(File.ReadAllText(file1));
var o2 = JObject.Parse(File.ReadAllText(file2));

o1.Merge(o2, new JsonMergeSettings
{
    MergeArrayHandling = MergeArrayHandling.Union
});

Console.WriteLine(JsonConvert.SerializeObject(o1));