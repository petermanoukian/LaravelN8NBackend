<?php

namespace App\Models\Traits;

trait FriendlyMime
{
    public function getFriendlyMimeAttribute(): string
    {
        return match ($this->mime) {
            // Documents
            'application/pdf' => 'PDF Document',
            'application/msword' => 'Word Document',
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document' => 'Word Document (DOCX)',

            // Spreadsheets
            'application/vnd.ms-excel' => 'Excel Spreadsheet',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' => 'Excel Spreadsheet (XLSX)',
            'text/csv' => 'CSV File',

            // Presentations
            'application/vnd.ms-powerpoint' => 'PowerPoint Presentation',
            'application/vnd.openxmlformats-officedocument.presentationml.presentation' => 'PowerPoint Presentation (PPTX)',

            // Data formats
            'application/json' => 'JSON File',
            'application/xml' => 'XML File',

            // Images
            'image/jpeg' => 'JPEG Image',
            'image/png' => 'PNG Image',
            'image/gif' => 'GIF Image',
            'image/svg+xml' => 'SVG Image',

            // Text
            'text/plain' => 'Plain Text File',
            'text/html' => 'HTML Document',
            'text/markdown' => 'Markdown Document',

            // Archives
            'application/zip' => 'ZIP Archive',
            'application/x-rar-compressed' => 'RAR Archive',

            // Default fallback
            default => $this->mime ?? 'Unknown',
        };
    }
}
