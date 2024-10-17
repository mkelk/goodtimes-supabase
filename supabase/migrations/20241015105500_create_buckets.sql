-- Create a new storage bucket for image blobs
INSERT INTO storage.buckets (id, name, public)
VALUES ('imageblobs', 'imageblobs', true);

-- Set up access control for the imageblob bucket
CREATE POLICY "Give users access to own folder" ON storage.objects
    FOR ALL
    TO authenticated
    USING (bucket_id = 'imageblobs'::text);

-- Allow users to insert objects into the imageblob bucket
CREATE POLICY "Allow users to upload images" ON storage.objects
    FOR INSERT
    TO authenticated
    WITH CHECK (bucket_id = 'imageblobs'::text);

-- Allow users to update their own objects in the imageblob bucket
CREATE POLICY "Allow users to update own images" ON storage.objects
    FOR UPDATE
    TO authenticated
    USING (bucket_id = 'imageblobs'::text);

-- Allow users to delete their own objects from the imageblob bucket
CREATE POLICY "Allow users to delete own images" ON storage.objects
    FOR DELETE
    TO authenticated
    USING (bucket_id = 'imageblobs'::text);
