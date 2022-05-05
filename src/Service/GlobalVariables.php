<?php 

namespace App\Service;
use App\Repository\AssociationsRepository;

class GlobalVariables{
    private $repo; 
    public function __construct(AssociationsRepository $repo)
    {
        $this->repo = $repo;
    }
    
    public function lastAssoc($user)
    {
        $associations = $this->repo->findAssociation($user);
        $assoc = array_pop($associations);
        return $assoc; 
    }

}