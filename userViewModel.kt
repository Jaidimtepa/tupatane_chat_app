package com.example.chatapp

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.google.firebase.firestore.FirebaseFirestore

// KAZI YA MWANACHAMA WA 6: KUVUTA LIST YA WATUMIAJI KUTOKA FIRESTORE
class UserViewModel : ViewModel() {

    private val db = FirebaseFirestore.getInstance()
    private val _users = MutableLiveData<List<User>>()
    val users: LiveData<List<User>> = _users

    fun fetchUsers() {
        // Hapa tunavuta collection inayoitwa "users"
        db.collection("users").addSnapshotListener { snapshot, error ->
            if (error != null) {
                return@addSnapshotListener
            }

            val userList = mutableListOf<User>()
            snapshot?.documents?.forEach { doc ->
                val user = doc.toObject(User::class.java)
                if (user != null) {
                    userList.add(user)
                }
            }
            // Hapa tunatuma list kwenda kwenye UI (RecyclerView)
            _users.value = userList
        }
    }
}
