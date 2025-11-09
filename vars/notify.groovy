// vars/notify.groovy
def call(String buildStatus = 'SUCCESS') {

    // Default build status
    buildStatus = buildStatus ?: 'SUCCESS'

    def color
    def message

    if (buildStatus == 'SUCCESS') {
        color = '#00FF00'  // Green
        message = "✅ *Build SUCCESS!* \nJob: ${env.JOB_NAME} #${env.BUILD_NUMBER}\nURL: ${env.BUILD_URL}"
    } else if (buildStatus == 'FAILURE') {
        color = '#FF0000'  // Red
        message = "❌ *Build FAILED!* \nJob: ${env.JOB_NAME} #${env.BUILD_NUMBER}\nURL: ${env.BUILD_URL}"
    } else {
        color = '#FFA500'  // Orange
        message = "⚠️ *Build UNSTABLE!* \nJob: ${env.JOB_NAME} #${env.BUILD_NUMBER}\nURL: ${env.BUILD_URL}"
    }

    // Send Slack Notification
    slackSend(
        channel: '#devops-alerts',   // 🔹 నీ Slack channel name ఇక్కడ ఇవ్వాలి
        color: color,
        message: message
    )

    echo "📢 Slack Notification Sent: ${buildStatus}"
}
