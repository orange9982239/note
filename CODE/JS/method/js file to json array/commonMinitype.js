class Minitype{
    static dictionary = {
        "csv":{
            "MIMEType":"text/csv",
            "destribution":"Comma-separated values (CSV)",
        },
        "doc":{
            "MIMEType":"application/msword",
            "destribution":"Microsoft Word",
        },
        "docx":{
            "MIMEType":"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "destribution":"Microsoft Word (OpenXML)",
        },
        "jpg":{
            "MIMEType":"image/jpeg",
            "destribution":"JPEG images",
        },
        "jpeg":{
            "MIMEType":"image/jpeg",
            "destribution":"JPEG images",
        },
        "json":{
            "MIMEType":"application/json",
            "destribution":"JSON format",
        },
        "mp3":{
            "MIMEType":"audio/mpeg",
            "destribution":"MP3 audio",
        },
        "mp4":{
            "MIMEType":"video/mp4",
            "destribution":"MP4 video",
        },
        "mpeg":{
            "MIMEType":"video/mpeg",
            "destribution":"MPEG Video",
        },
        "odp":{
            "MIMEType":"application/vnd.oasis.opendocument.presentation",
            "destribution":"OpenDocument presentation document",
        },
        "ods":{
            "MIMEType":"application/vnd.oasis.opendocument.spreadsheet",
            "destribution":"OpenDocument spreadsheet document",
        },
        "odt":{
            "MIMEType":"application/vnd.oasis.opendocument.text",
            "destribution":"OpenDocument text document",
        },
        "ppt":{
            "MIMEType":"application/vnd.ms-powerpoint",
            "destribution":"Microsoft PowerPoint",
        },
        "pptx":{
            "MIMEType":"application/vnd.openxmlformats-officedocument.presentationml.presentation",
            "destribution":"Microsoft PowerPoint (OpenXML)",
        },
        "rar":{
            "MIMEType":"application/vnd.rar",
            "destribution":"RAR archive",
        },
        "txt":{
            "MIMEType":"text/plain",
            "destribution":"Text, (generally ASCII or ISO 8859-n)",
        },
        "xls":{
            "MIMEType":"application/vnd.ms-excel",
            "destribution":"Microsoft Excel",
        },
        "xlsx":{
            "MIMEType":"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "destribution":"Microsoft Excel (OpenXML)",
        },
        "zip":{
            "MIMEType":"application/zip",
            "destribution":"ZIP archive",
        }
    };
    static getByExtension(Extension){
        let ext = Extension
            .trim()
            .toLowerCase()
        return this.dictionary[ext]["MIMEType"];
    }
    static getByFullFilename(FullFilename){
        let ext = FullFilename
            .trim()
            .split('.').pop()
            .toLowerCase()
    return this.dictionary[ext]["MIMEType"];
    }
}

//直轉副檔名
console.log(Minitype.getByExtension("dOcx"));

//完整檔名取
console.log(Minitype.getByFullFilename("檔案名稱.JPG"));