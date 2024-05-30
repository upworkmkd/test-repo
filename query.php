use Illuminate\Support\Facades\DB;

$siteId = 123; // Example site_id value

$subQuery = DB::table('uptime_data')
    ->select(
        'id',
        'site_id',
        'status_code',
        'status_message',
        'created_at',
        'updated_at',
        DB::raw('LAG(status_code) OVER (PARTITION BY site_id ORDER BY created_at) AS previous_status_code')
    )
    ->where('site_id', $siteId);

$results = DB::table(DB::raw("({$subQuery->toSql()}) as sub"))
    ->mergeBindings($subQuery)
    ->select('id', 'site_id', 'status_code', 'status_message', 'created_at', 'updated_at')
    ->where('site_id', $siteId)
    ->where(function ($query) {
        $query->where(function ($query) {
            $query->where('status_code', 200)
                  ->where('previous_status_code', '!=', 200);
        })->orWhere(function ($query) {
            $query->where('status_code', '!=', 200)
                  ->where('previous_status_code', 200);
        });
    })
    ->orderBy('site_id')
    ->orderBy('created_at')
    ->get();
