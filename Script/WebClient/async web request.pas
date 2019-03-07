ShowMessage('Async HTTP request demo - single download');

var Request := WebClient.Connect('http://speedtest.tele2.net');
var Response := Request.Execute('GET', '/100MB.zip');

var Progress := ShowProgress('Downloading 100 Mb test data', False);
Progress.EnableAbort := True;
Progress.RaiseOnAbort := False;

var ContentLength := Response.ContentLength;
Progress.Progress(psBegin, 0, ContentLength, Format('Requested: %.0n bytes', [Float(ContentLength)]));

while (not Response.Completed) do
begin
  Sleep(100);

  if (ContentLength = 0) then
    ContentLength := Response.ContentLength;

  Progress.Progress(psProgress, Response.CurrentContentSize, ContentLength, Format('Downloaded: %.0n bytes (%.1n %%)', [Float(Response.CurrentContentSize), Response.CurrentContentSize/ContentLength*100]));

  if (Progress.Aborted) then
    Response.Abort;
end;

Progress := nil;

if (not Response.Success) then
begin
  if (Response.Aborted) then
    ShowMessage('Aborted')
  else
  if (Response.Failed) then
    ShowMessage(Format('Error: %s', [Response.ErrorMessage]))
  else
    ShowMessage(Format('Failed: %s (%d)', [Response.StatusDescription, Response.StatusCode]));
end else
  ShowMessage(Format('Completed: %.0n bytes (%.1n %%)', [Float(Response.CurrentContentSize), Response.CurrentContentSize/ContentLength*100]));
