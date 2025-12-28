<?php

namespace App\Http\Controllers\external;

use App\Http\Controllers\Controller;
use App\Services\external\ProdcatService;
use Illuminate\View\View;

class ProdcatController extends Controller
{
    protected ProdcatService $service;

    public function __construct(ProdcatService $service)
    {
        $this->service = $service;
    }

    /**
     * Display a paginated listing of prodcats (read-only).
     *
     * @return View
     */
    public function index(): View
    {
        // Use the repository’s paginate method via the service
        $prodcats = $this->service->paginate(
            perPage: 15,
            fields: ['id','originid','name','des','dess','filename','fileurl','mime','sizer','extension','created_at','updated_at'],
            orderBy: 'id',
            direction: 'desc'
        );

        return view('admin.external.prodcats.index', compact('prodcats'));
    }
}
