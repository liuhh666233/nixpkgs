{ lib
, buildPythonPackage
, fetchPypi
, aiohttp
, requests
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pyTelegramBotAPI";
  version = "4.4.1";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3Qppp/UDKiGChnvMOgW8EKygI75gYzv37c0ctExmK+g=";
  };

  propagatedBuildInputs = [
    aiohttp
    requests
  ];

  pythonImportsCheck = [
    "telebot"
  ];

  meta = with lib; {
    homepage = "https://github.com/eternnoir/pyTelegramBotAPI";
    description = "A simple, but extensible Python implementation for the Telegram Bot API";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ das_j ];
  };
}
