<%@ page import="java.io.*, java.util.Date, java.text.SimpleDateFormat" %>
<%
try {
    String logDirPath = "/usr/local/tomcat/logs";
    String logFilePath = logDirPath + "/app.log";
    
    File logDir = new File(logDirPath);
    if (!logDir.exists()) {
        logDir.mkdirs();
    }
    
    PrintWriter outLog = new PrintWriter(new FileWriter(logFilePath, true));
    String timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    outLog.println(timestamp + " - Page accessed by a user.");
    outLog.close();
} catch (IOException e) {
    e.printStackTrace();
}
%>
<html>
<body>
    <h1>Welcome to Tran Phan Hoang Phuc's Web App</h1>
    <p style="color: green;"><b>A new log entry was just added to /usr/local/tomcat/logs/app.log!</b></p>
    <p>This application demonstrates Docker persistent storage using volumes.</p>
</body>
</html>
