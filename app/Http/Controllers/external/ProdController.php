<?php

namespace App\Http\Controllers\external;

use App\Http\Controllers\Controller;
use App\Services\external\ProdService;
use Illuminate\View\View;

class ProdController extends Controller
{
    protected ProdService $service;

    public function __construct(ProdService $service)
    {
        $this->service = $service;
    }

    /**
     * Display a paginated listing of prods (read-only).
     *
     * @return View
     */
    public function index(): View
    {
        // Use the repository’s paginate method via the service
        $prods = $this->service->paginate(
            perPage: 15,
            fields: [
                'id',
                'originid',
                'catid',
                'name',
                'des',
                'dess',
                'filer',
                'filename',
                'fileurl',
                'mime',
                'sizer',
                'extension',
                'img',
                'img2',
                'eventtype',
                'created_at',
                'updated_at'
            ],
            orderBy: 'id',
            direction: 'desc'
        );

        return view('admin.external.prods.index', compact('prods'));
    }
}
