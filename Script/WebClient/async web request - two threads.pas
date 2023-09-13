ShowMessage('Async HTTP request demo - two concurrent downloads');

var Request := WebClient.Connect('http://speedtest.tele2.net');
var Response1 := Request.Execute('GET', '/100MB.zip');
var Response2 := Request.Execute('GET', '/100MB.zip');

var Progress := ShowProgress('Downloading 100 Mb test data', False);
Progress.EnableAbort := True;
Progress.RaiseOnAbort := False;

var ContentLength1 := Response1.ContentLength;
var ContentLength2 := Response2.ContentLength;

var Msg := Format('1) Requested: %.0n bytes', [Float(ContentLength1)])+#13+
           Format('2) Requested: %.0n bytes', [Float(ContentLength2)]);
Progress.Progress(psBegin, 0, ContentLength1+ContentLength2, Msg);

while (not Response1.Completed) or (not Response2.Completed) do
begin
  Sleep(500);

  if (ContentLength1 = 0) then
    ContentLength1 := Response1.ContentLength;

  if (ContentLength2 = 0) then
    ContentLength2 := Response2.ContentLength;

  if (not Response1.Completed) then
  begin
    if (ContentLength1 <> 0) then
      Msg := Format('1) Downloaded: %.0n bytes (%.1n %%)', [Float(Response1.CurrentContentSize), Response1.CurrentContentSize/ContentLength1*100])+#13
    else
      Msg := '1) ...';
  end else
    Msg := Format('1) Completed: %.0n bytes', [Float(Response1.CurrentContentSize)])+#13;

  if (not Response2.Completed) then
  begin
    if (ContentLength1 <> 0) then
      Msg := Msg + Format('2) Downloaded: %.0n bytes (%.1n %%)', [Float(Response2.CurrentContentSize), Response2.CurrentContentSize/ContentLength2*100])
    else
      Msg := Msg + '2) ...';
  end else
    Msg := Msg + Format('2) Completed: %.0n bytes', [Float(Response2.CurrentContentSize)]);

  Progress.Progress(psProgress, Response1.CurrentContentSize+Response2.CurrentContentSize, ContentLength1+ContentLength2, Msg);

  if (Progress.Aborted) then
  begin
    if (not Response1.Completed) then
      Response1.Abort;
    if (not Response2.Completed) then
      Response2.Abort;
  end;
end;

Progress := nil;

if (not Response1.Success) then
begin
  if (Response1.Aborted) then
    ShowMessage('1) Aborted')
  else
  if (Response1.Failed) then
    ShowMessage(Format('1) Error: %s', [Response1.ErrorMessage]))
  else
    ShowMessage(Format('1) Failed: %s (%d)', [Response1.StatusDescription, Response1.StatusCode]));
end else
  ShowMessage(Format('1) Completed: %.0n bytes (%.1n %%)', [Float(Response1.CurrentContentSize), Response1.CurrentContentSize/ContentLength1*100]));

if (not Response2.Success) then
begin
  if (Response2.Aborted) then
    ShowMessage('2) Aborted')
  else
  if (Response2.Failed) then
    ShowMessage(Format('2) Error: %s', [Response2.ErrorMessage]))
  else
    ShowMessage(Format('2) Failed: %s (%d)', [Response2.StatusDescription, Response2.StatusCode]));
end else
  ShowMessage(Format('2) Completed: %.0n bytes (%.1n %%)', [Float(Response2.CurrentContentSize), Response2.CurrentContentSize/ContentLength2*100]));
