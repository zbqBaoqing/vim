echo off
set PORT=%1
echo [DEFAULT] > cfg\at.cfg
echo ConnectionType=acceptor >> cfg\at.cfg
echo SocketAcceptPort=%PORT% >> cfg\at.cfg
echo SocketReuseAddress=Y >> cfg\at.cfg
echo StartTime=00:00:00 >> cfg\at.cfg
echo EndTime=00:00:00 >> cfg\at.cfg
echo SenderCompID=ISLD >> cfg\at.cfg
echo TargetCompID=TW >> cfg\at.cfg
echo ResetOnLogon=Y >> cfg\at.cfg
echo FileStorePath=store >> cfg\at.cfg
echo [SESSION] >> cfg\at.cfg
echo BeginString=FIX.4.0 >> cfg\at.cfg
echo DataDictionary=..\spec\FIX40.xml >> cfg\at.cfg
echo [SESSION] >> cfg\at.cfg
echo BeginString=FIX.4.1 >> cfg\at.cfg
echo DataDictionary=..\spec\FIX41.xml >> cfg\at.cfg
echo [SESSION] >> cfg\at.cfg
echo BeginString=FIX.4.2 >> cfg\at.cfg
echo DataDictionary=..\spec\FIX42.xml >> cfg\at.cfg
echo [SESSION] >> cfg\at.cfg
echo BeginString=FIX.4.3 >> cfg\at.cfg
echo DataDictionary=..\spec\FIX43.xml >> cfg\at.cfg
echo [SESSION] >> cfg\at.cfg
echo BeginString=FIX.4.4 >> cfg\at.cfg
echo DataDictionary=..\spec\FIX44.xml >> cfg\at.cfg
echo [SESSION] >> cfg\at.cfg
echo BeginString=FIXT.1.1 >> cfg\at.cfg
echo DefaultApplVerID=FIX.5.0 >> cfg\at.cfg
echo TransportDataDictionary=..\spec\FIXT11.xml >> cfg\at.cfg
echo AppDataDictionary=..\spec\FIX50.xml >> cfg\at.cfg

echo [DEFAULT] > cfg\atsp1.cfg
echo ConnectionType=acceptor >> cfg\atsp1.cfg
echo SocketAcceptPort=%PORT% >> cfg\atsp1.cfg
echo SocketReuseAddress=Y >> cfg\atsp1.cfg
echo StartTime=00:00:00 >> cfg\atsp1.cfg
echo EndTime=00:00:00 >> cfg\atsp1.cfg
echo SenderCompID=ISLD >> cfg\atsp1.cfg
echo TargetCompID=TW >> cfg\atsp1.cfg
echo ResetOnLogon=Y >> cfg\atsp1.cfg
echo FileStorePath=store >> cfg\atsp1.cfg
echo [SESSION] >> cfg\atsp1.cfg
echo BeginString=FIXT.1.1 >> cfg\atsp1.cfg
echo DefaultApplVerID=FIX.5.0SP1 >> cfg\atsp1.cfg
echo TransportDataDictionary=..\spec\FIXT11.xml >> cfg\atsp1.cfg
echo AppDataDictionary=..\spec\FIX50SP1.xml >> cfg\atsp1.cfg

echo [DEFAULT] > cfg\atsp2.cfg
echo ConnectionType=acceptor >> cfg\atsp2.cfg
echo SocketAcceptPort=%PORT% >> cfg\atsp2.cfg
echo SocketReuseAddress=Y >> cfg\atsp2.cfg
echo StartTime=00:00:00 >> cfg\atsp2.cfg
echo EndTime=00:00:00 >> cfg\atsp2.cfg
echo SenderCompID=ISLD >> cfg\atsp2.cfg
echo TargetCompID=TW >> cfg\atsp2.cfg
echo ResetOnLogon=Y >> cfg\atsp2.cfg
echo FileStorePath=store >> cfg\atsp2.cfg
echo [SESSION] >> cfg\atsp2.cfg
echo BeginString=FIXT.1.1 >> cfg\atsp2.cfg
echo DefaultApplVerID=FIX.5.0SP2 >> cfg\atsp2.cfg
echo TransportDataDictionary=..\spec\FIXT11.xml >> cfg\atsp2.cfg
echo AppDataDictionary=..\spec\FIX50SP2.xml >> cfg\atsp2.cfg
