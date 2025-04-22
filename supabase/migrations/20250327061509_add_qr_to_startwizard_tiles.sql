ALTER TABLE start_wizard_status
ADD COLUMN qrcode_status TEXT DEFAULT 'in_progress',
ADD COLUMN qrcode_done_at TIMESTAMPTZ;

UPDATE start_wizard_status
SET qrcode_status = 'not_relevant';


UPDATE start_wizard_status sws
SET 
    qrcode_status = 'done',
    qrcode_done_at = NOW()
FROM qr_codes_senior qcs
WHERE 
    sws.user_id = qcs.user_id AND
    qcs.used_at IS NOT NULL AND
    sws.qrcode_status = 'not_relevant';
