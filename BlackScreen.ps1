# Black Screen Overlay - Fullscreen black window for overnight use
# Press ESC to exit

# Load required assemblies
Add-Type -AssemblyName System.Windows.Forms -ErrorAction Stop
Add-Type -AssemblyName System.Drawing -ErrorAction Stop

# Hide cursor
[System.Windows.Forms.Cursor]::Hide()

# Create fullscreen black form
$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.TopMost = $true
$form.BackColor = [System.Drawing.Color]::Black
$form.ShowInTaskbar = $false
$form.ControlBox = $false
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::Manual

# Cover all screens
$allScreens = [System.Windows.Forms.Screen]::AllScreens
$totalBounds = [System.Drawing.Rectangle]::Empty

foreach ($screen in $allScreens) {
    if ($totalBounds.IsEmpty) {
        $totalBounds = $screen.Bounds
    } else {
        $totalBounds = [System.Drawing.Rectangle]::Union($totalBounds, $screen.Bounds)
    }
}

$form.Location = $totalBounds.Location
$form.Size = $totalBounds.Size
$form.Cursor = [System.Windows.Forms.Cursors]::None

# Handle ESC to exit
$form.KeyPreview = $true
$form.Add_KeyDown({
    if ($_.KeyCode -eq [System.Windows.Forms.Keys]::Escape) {
        $form.Close()
    }
})

# Show form
$form.ShowDialog() | Out-Null

# Restore cursor
[System.Windows.Forms.Cursor]::Show()
