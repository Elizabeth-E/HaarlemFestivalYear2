<?php
namespace App\Models;

class Page extends AppModel
{
    private $page_id;
    private $page_name;
    private $page_description;
    private $page_header;

    public function __construct($page_id, $page_name, $page_description, $page_header)
    {
        $this->page_id = $page_id;
        $this->page_name = $page_name;
        $this->page_description = $page_description;
        $this->page_header = $page_header;
    }

    public function setPageId(int $page_id)
    {
        $this->page_id = $page_id;
    }

    public function setPageName(string $page_name)
    {
        $this->page_name = $page_name;
    }

    public function setPageDescription(string $page_description)
    {
        $this->page_description = $page_description;
    }

    public function setPageHeader(string $page_header)
    {
        $this->page_header = $page_header;
    }

    public function getPageId()
    {
        return $this->page_id;
    }

    public function getPageName()
    {
        return $this->page_name;
    }

    public function getPageDescription()
    {
        return $this->page_description;
    }

    public function getPageHeader()
    {
        return $this->page_header;
    }
}
?>