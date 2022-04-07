public struct BreedImageDTO: Decodable
{
    var height: Int?
    var id: String?
    var url: String?
    var width: Int?
    init (height: Int, id: String, url: String, width:Int)
    {
        self.height = height
        self.id = id
        self.url = url
        self.width = width
    }
    init()
    {
        self.height = 0
        self.id = ""
        self.url = "http://amgestoroutput.s3.amazonaws.com/jcmateriais/img_produtos/1056-07373327.jpeg"
        self.width = 0
    }
}
