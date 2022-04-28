class DownloadFile{
    static byJSONbase64FileArray(JSONbase64FileArray){
        JSONbase64FileArray.forEach(JSONbase64File => {
            let link = document.createElement("a");
            document.body.appendChild(link);
            link.setAttribute("href", `data:${JSONbase64File.mimeType};base64,${JSONbase64File.base64Data}`);
            link.setAttribute("download", JSONbase64File.fileName);
            link.click();
        });
    }
}

DownloadFile.byJSONbase64FileArray();
