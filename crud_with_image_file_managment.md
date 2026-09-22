You are a senior Flutter architect.

I am building a CRUD screen (Add/Edit) with optional image upload using Supabase Storage.

I want a clean, production-level implementation with proper file management, cost optimization, and UI-state handling.

### CONTEXT

* Backend: Supabase Storage
* UI: Flutter (StatefulWidget + Provider)
* StorageService already supports:

  * uploadImage
  * replaceImage
  * deleteImage

### REQUIREMENTS

Implement a complete Add/Edit screen with the following:

---

## 🔥 IMAGE STATE MANAGEMENT (IMPORTANT)

Use an enum to track image state:

* none → no change
* added → new image added
* replaced → existing image replaced
* removed → existing image deleted

Ensure:

* No duplicate uploads
* No orphan files
* Minimum storage cost

---

## 🔥 IMAGE HANDLING LOGIC

Handle these cases:

1. Add screen:

   * If image selected → upload
   * If no image → do nothing

2. Edit screen:

   * If no change → keep existing
   * If new image selected → replace old image
   * If image removed → delete from storage
   * If image added (previously empty) → upload

---

## 🔥 UI REQUIREMENTS

* Use ValueNotifier<File?> for image
* Show:

  * ImagePreviewCard (if image exists)
  * ImagePickerCard (if no image)
* Show loading state when caching image
* Handle delete button properly

---

## 🔥 IMAGE SOURCE HANDLING

IMPORTANT:

* Existing image (from URL) should be cached to File
* Must distinguish between:

  * cached image (existing)
  * newly picked image

---

## 🔥 SUBMIT LOGIC

Use switch-case on ImageAction:

* added → uploadImage
* replaced → replaceImage
* removed → deleteImage
* none → do nothing

---

## 🔥 CLEAN CODE RULES

* No duplicate API calls
* No unnecessary uploads
* Null-safe handling
* Proper error handling with user feedback
* Keep UI simple and reactive

---

## 🔥 OUTPUT FORMAT

Give:

1. Full StatefulWidget screen code
2. ImageAction enum
3. Updated submit logic
4. Clean and reusable structure

---

Use best practices and production-level architecture.

Avoid overengineering. Keep it clean, scalable, and cost-efficient.
