(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is TurboPower Abbrevia
 *
 * The Initial Developer of the Original Code is
 * Robert Love
 *
 * Portions created by the Initial Developer are Copyright (C) 1997-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

unit AbSelfExTests;

interface

uses
  SysUtils,classes,AbTestFrameWork,TestFrameWork,AbSelfEx;

type

  TAbSelfExTests = class(TabCompTestCase)
  private
    Component : TAbMakeSelfExe;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDefaultStreaming;
  end;

implementation

{ TAbSelfExTests }

procedure TAbSelfExTests.SetUp;
begin
  inherited;
  Component := TAbMakeSelfExe.Create(TestForm);
end;

procedure TAbSelfExTests.TearDown;
begin
  inherited;

end;



procedure TAbSelfExTests.TestDefaultStreaming;
var
  CompStr : String;
  CompTest : TAbMakeSelfExe;
begin
  RegisterClass(TAbMakeSelfExe);
  CompStr  := StreamComponent(Component);
  CompTest := (UnStreamComponent(CompStr) as TAbMakeSelfExe);
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbMakeSelfExe);
end;

initialization

  TestFramework.RegisterTest('Abbrevia.Component Level Test Suite',
    TAbSelfExTests.Suite);

end.

 