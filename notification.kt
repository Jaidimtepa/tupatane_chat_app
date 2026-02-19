// ChatViewModel.kt
db.collection("chats").whereIn("senderId", listOf(myId, hisId))
    .orderBy("timestamp", Query.Direction.ASCENDING)
    .addSnapshotListener { snapshot, _ -> /* Update Chat UI */ }
